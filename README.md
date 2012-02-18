# Crispy Mobile

## What does it do?

Crispy Mobile empowers your Rails application with easy-accessible device-detection.
In your controller or view, you can access device properties or add switches like:

``` haml
- if device == :desktop
  = stylesheet_link_tag :desktop
- else
  = stylesheet_link_tag :mobile

= image_tag @photo.dynamic_url(device > :handheld_480 ? '600x400' : '300x200')

= image_tag @photo.dynamic_url("#{device.display_width}x")
```

## Why should my app be responsive on the server side?

CSS media queries are nice. But not for mobile.

They just add up code you send to your clients instead of reducing it
for mobile devices.

Imagine you want to make a responsive product page.

* Do you really want to deliver a big 90KB product photo, if a
  15KB photo would already fill the mobile screen?
* Do you really want to compute personalized product recommendations if
  they are just hidden afterwards?
* Do you really want mobile devices to download and interpret your whole
  stylesheet if half of the interface elements are going to be hidden anyway?

You don't.

If you start mobile-first, don't let your mobile performance be affected by
additional desktop features.

Be kind, serve the clients exactly what they need.

### How is it done?

A middleware is introduced which looks up the user agent string in the
[WURFL repository](http://wurfl.sourceforge.net/).

## Usage

Pending. Please have a look at the source.

## Installation

In your Gemfile add:

    gem 'crispy-mobile'

## License

See MIT-LICENSE.
