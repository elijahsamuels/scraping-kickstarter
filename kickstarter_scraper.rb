# require libraries/modules here

require "nokogiri"
require "pry"

  def create_project_hash
    # This just opens a file and reads it into a variable
    html = File.read('fixtures/kickstarter.html')
    kickstarter = Nokogiri::HTML(html)
  
    projects = {}
  
      # Iterate through the projects
      kickstarter.css("li.project.grid_4").each do |project|
        title = project.css("h2.bbcard_name strong a").text
        projects[title.to_sym] = {
          :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
          :description => project.css("p.bbcard_blurb").text,
          :location => project.css("ul.project-meta span.location-name").text,
          :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
        }
        end
    
          # kickstarter.css("li.project.grid_4").each do |project|
          #   projects[project] = {}
          # end

    # return the projects hash
    projects

    # Selecting the Projects
    # projects: kickstarter.css("li.project.grid_4") 
    
    # Selecting the Title
    # title: project.css("h2.bbcard_name strong a").text 
   
    # Selecting the Image Link
    # image link: project.css("div.project-thumbnail a img").attribute("src").value 
    
    # Selecting the Description
    # project.css("p.bbcard_blurb").text 

    # selecting the location (both work)
    # location: project.css("ul.project-meta span.location-name").text
    # location: project.css("ul.project-meta a span").children.text

    # Selecting the Percent Funded
    # percent_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i 

  end

  create_project_hash
