module CheatSheet
  class CommandOptions

    OPTIONS = {
        :links => 'Working with links',
        :buttons => 'Interacting with buttons',
        :navigating => 'Moving between pages',
        :interacting => 'Interacting with forms',
        :scoping => 'Page interaction and scoping',
        :scripting => 'Carrying out scripting',
        :debugging => 'Commands for debugging',
        :querying => 'Lists all commands for querying source',
        :javascript => 'Working with asynchronous Javascript',
        :selectors => 'Css and xpath selectors for elements',
        :exit => 'To exit app'
    }

    SEARCH_KEYS = {
        :buttons => 'buttons',
        :links => 'buttons',
        :navigating => 'Navigating',
        :interacting => 'Interacting',
        :scoping => 'scoping',
        :debugging => 'Debugging',
        :querying => 'Querying',
        :scripting => 'Scripting',
        :javascript => 'Asynchronous',
        :selectors => 'CSS'
    }

    DEFAULTS = %w(exit help)
  end
end