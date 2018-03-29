module Zanata
  module Headless
    require 'selenium-webdriver'

    @base_url = 'http://localhost:8080/zanata'
    class Project
      attr_reader :id, :name, :description, :translator, :file_path

      def initialize(id, name, translator, file_path, description)
        @id = id
        @name = name
        @translator = translator
        @file_path = file_path
        @description = description
      end
    end

    module_function

      def login
        p 'Logging in to Zanata'
        url = @base_url + '/account/sign_in'
        @driver.navigate.to url
        form_username = @driver.find_element name: 'loginForm:username'
        form_password = @driver.find_element name: 'loginForm:password'
        form_button = @driver.find_element name: 'loginForm:loginButton'
        form_username.send_keys 'admin'
        form_password.send_keys 'admin1234'
        form_button.click
      end

      def create_project
        p 'Creating a Project'
        url = @base_url + '/project/create'
        @driver.navigate.to url
        form_project_name = @driver.find_element name: 'project-form:name:input:name'
        form_project_id = @driver.find_element name: 'project-form:slug:input:slug'
        form_description = @driver.find_element name: 'project-form:description:input:description'
        form_button = @driver.find_element name: 'project-form:create-new'
        form_project_name.send_keys @project.name
        form_project_id.send_keys @project.id
        form_description.send_keys @project.description
        form_button.click

      end

      def create_version
        p 'Creating a Version'
        url = @base_url + "/project/add_iteration/#{@project.id}"
        @driver.navigate.to url
        version_id = @driver.find_element name: 'create-version-form:slug:input:slug'
        form_button = @driver.find_element name: 'create-version-form:button-create'
        version_id.send_keys 1
        form_button.click
      end

      def assign_language(version_id = 1)
        p 'Assigning a Language'
        url = @base_url + "/iteration/view/#{@project.id}/#{version_id}/settings/languages"
        @driver.navigate.to url
        enable_button = @driver.find_element name: 'settings-languages-form:j_idt1143:0:j_idt1147:j_idt1149'
        enable_button.click
      end

      def assign_translator
        p 'Assigning a translator'
        url = @base_url + "/project/view/#{@project.id}/people"
        @driver.navigate.to url
        add_someone_button = @driver.find_element name: 'project-people_add:project-people_addbutton:j_idt301'
        add_someone_button.click
        sleep(2)
        username_input = @driver.find_element id: 'modalManagePermissionsAutocomplete-autocomplete__input'
        add_person_button = @driver.find_element name: 'peopleTab-permissions:j_idt602'
        username_input.send_keys @project.translator + "\n"
        sleep(2)
        @driver.action.send_keys("\n").perform
        sleep(2)
        translate_content = @driver.find_element id: 'peopleTab-permissions:j_idt565:0:j_idt567'
        translate_content.click
        submit_button = @driver.find_element id: 'peopleTab-permissions:j_idt602'
        submit_button.click
      end

      def upload_file
        p 'Uploading a file'
        url = @base_url + "/iteration/view/#{@project.id}/1/settings/documents"
        @driver.navigate.to url
        file_upload_button = @driver.find_element id: 'file-upload-component-toggle-button'
        file_upload_button.click
        sleep(1)
        file_upload_input = @driver.find_element id: 'file-upload-component-file-input'
        file_upload_input.send_keys @project.file_path
        sleep(1)
        submit_button = @driver.find_element id: 'file-upload-component-start-upload'
        submit_button.click
      end

      def initialize_driver
        options = Selenium::WebDriver::Firefox::Options.new(args: ['-headless'])
        @driver = Selenium::WebDriver.for :firefox, options: options
      end

      def work(project_id, project_name, project_translator, file_path, project_description = '')
        @project = Project.new(project_id, project_name, project_translator,
                               file_path, project_description)
        initialize_driver
        login
        create_project
        create_version
        #assign_language('deneme' + seed.to_s)
        assign_translator
        upload_file
        @driver.close
      end
  end

  module Api
    def proggression
    end

    def translated_file
    end
  end
end

#Zanata::Headless.main(Random.rand(1..10**8), 'deneme', 'ahmet', '~/Desktop/deneme.odt')