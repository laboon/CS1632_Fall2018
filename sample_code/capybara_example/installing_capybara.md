## OS X

1. Ensure you have installed Xcode (https://developer.apple.com/xcode/)
2. Install homebrew (https://brew.sh/)
3. Install qt (at terminal, type _brew install qt_)
4. Run _echo 'export PATH="/usr/local/opt/qt/bin:$PATH"' >> ~/.bash_profile_
4. Run _source ~/.bash_profile_
4. Run _gem install capybara_
4. Run _gem install capybara-webkit_
4. Run _bundle install_ in the directory of your tests (if you have not yet installed bundler, first _gem install bundler_)


## Linux (Ubuntu)

_Note: you will need root privs for this_

1. Run _sudo apt-get install libqt4-dev libqtwebkit-dev_
4. Run _gem install capybara_
4. Run _gem install capybara-webkit_
2. Run _bundle install_ in the directory of your tests (if you have not yet installed bundler, first _gem install bundler_)

## Windows

1. Download and install the Ruby Developer Kit if you have not done so yet (https://rubyinstaller.org/downloads/)
2. Using the Command Prompt or PowerShell prompt, go to the directory you have installed the Ruby Developer Kit
3. Run _ruby dk.rb init_
4. Run _ruby dk.rb install_
5. Run _gem install capybara_
6. Run _gem install capybara-webkit_
2. Run _bundle install_ in the directory of your tests (if you have not yet installed bundler, first _gem install bundler_)
