# Latent Object Detector

[<img src="https://secure.travis-ci.org/kerrizor/latent_object_detector.png" />](http://travis-ci.org/kerrizor/latent_object_detector)

![Yo Dawg](http://i.imgur.com/HvSZA4i.jpg)

Based on an original idea from Corey, this gem looks at the methods defined on an object and looks for repeated words contained in the method names, as this can sometimes illuminate latent objects, concepts, or relationships that don't currently exist in the code (but should.)

## Installation

Add this line to your application's Gemfile:

    gem 'latent_object_detector'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install latent_object_detector

## Usage
```
d = LatentObjectDetector::Detector.for(User)
d.potential_objects
=> ["password", "token", "remember"]
d.suspicious_methods
=> [:change_password, :generate_token, :remember_token?, :remember_me, :uses_deprecated_password?, :password_matches?, :crypt_password, :password_required?, :password_handler]
```
 Then go refactor those latent objects!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
