module Zanata
  module Headless
    require 'selenium-webdriver'

    @base_url = 'http://localhost:8080/zanata'
    
    module_function

      def login
        p 'Logging in to Zanata'
        url = @base_url + '/account/sign_in'
        #driver = initialize_driver
        @driver.navigate.to url
        form_username = @driver.find_element name: 'loginForm:username'
        form_password = @driver.find_element name: 'loginForm:password'
        form_button = @driver.find_element name: 'loginForm:loginButton'
        form_username.send_keys 'admin'
        form_password.send_keys 'admin1234'
        form_button.click
      end

      def create_project(project_name, project_id, project_description)
        p 'Creating a Project'
        url = @base_url + '/project/create'
        @driver.navigate.to url
        form_project_name = @driver.find_element name: 'project-form:name:input:name'
        form_project_id = @driver.find_element name: 'project-form:slug:input:slug'
        form_description = @driver.find_element name: 'project-form:description:input:description'
        form_button = @driver.find_element name: 'project-form:create-new'
        form_project_name.send_keys project_name
        form_project_id.send_keys(project_id)
        form_description.send_keys project_description
        form_button.click

      end

      def create_version(project_id)
        p 'Creating a Version'
        url = @base_url + "/project/add_iteration/#{project_id}"
        @driver.navigate.to url
        version_id = @driver.find_element name: 'create-version-form:slug:input:slug'
        form_button = @driver.find_element name: 'create-version-form:button-create'
        version_id.send_keys 1
        form_button.click
      end

      def assign_language(project_id, version_id = 1)
        p 'Assigning a Language'
        url = @base_url + "/iteration/view/#{project_id}/#{version_id}/settings/languages"
        @driver.navigate.to url
        enable_button = @driver.find_element name: 'settings-languages-form:j_idt1143:0:j_idt1147:j_idt1149'
        enable_button.click
      end

      def assign_translator(project_id, username = 'admin')
        p 'Assigning a translator'
        url = @base_url + "/project/view/#{project_id}/people"
        @driver.navigate.to url
        add_someone_button = @driver.find_element name: 'project-people_add:project-people_addbutton:j_idt301'
        add_someone_button.click

        username_input = @driver.find_element id: 'modalManagePermissionsAutocomplete-autocomplete__input'
        add_person_button = @driver.find_element name: 'peopleTab-permissions:j_idt602'
        username_input.send_keys username + "\n"
        sleep(2)
        @driver.action.send_keys("\n").perform
        #person_tab = @driver.find_element id: 'peopleTab-permissions:modalManagePermissionsAutocomplete:modalManagePermissionsAutocomplete-result'
        #person_tab.click
        #add_person_button.click
      end

      def upload_file
        p 'Uploading a file'
      end

      def initialize_driver
        @driver = Selenium::WebDriver.for :firefox
      end

      def main
        seed = Random.rand(100..1000)
        initialize_driver
        login
        create_project('deneme', 'deneme' + seed.to_s, 'deneme')
        create_version('deneme' + seed.to_s)
        assign_language('deneme' + seed.to_s)
        assign_translator('deneme' + seed.to_s)
        upload_file
      end
  end

  module Api
  end
end

Zanata::Headless.main