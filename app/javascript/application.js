// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import 'bootstrap';

import '@hotwired/turbo-rails';

import './dropdown';

window.process = {
  env: {
    NODE_ENV: 'development',
  },
};
