module ApplicationHelper
  require './lib/zanata/zanata'

  def translation_progress(project_id)
    progress = Zanata::Api.proggression(project_id)
    progress['locale'] = 'İngilizce'
    progress['percentage'] = (progress['translated'].to_f / progress['total'].to_f * 100).to_s.first(4)
    progress['lastTranslate'] = progress['lastTranslated'].split('by')[0]
    progress['lastTranslatedP'] = progress['lastTranslated'].split('by')[1]
    progress
  end

  def translated_file_url(project_id, filename)
  	"localhost:8080/zanata/rest/file/translation/#{project_id}/1/en-US/baked?docId=#{filename}"
  end

  def zanata_project_url(project_id, filename)
  	"http://localhost:8080/zanata/webtrans/translate?project=#{project_id}&iteration=1&localeId=en-US&locale=tr-TR&dswid=-5454#view:doc;doc:#{filename}"
  end
end
