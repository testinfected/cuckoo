module NavigationHelpers

  #todo: consider using Kelp#go_to_page
  def go_to(page_name)
    visit path_to(page_name.to_s.gsub(/_/, ' '))
  end

  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    when /^(the )?proposals page$/
      '/proposals'

    when /^(the )?new proposal page$/
      '/proposals/new'

    when /^(.*) guest pass link$/
      proposal = Proposal.find_last_by_subject($1)
      "/guest_passes/#{proposal.guest_pass_token}"

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
