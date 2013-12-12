# DashedMap

Do you ever find yourself wishing you had a method that takes an array of
words and then return an array of words, some of them combined by a dash?
Well you're in luck!

## Installation

Add the following to your Gemfile:

    gem 'dashed_map'

## Usage

Just call `dashed_map` anywhere. ANYWHERE. It's on Object.

If you need it on BasicObject as well (which you probably do), you'll want
to run the following code:

    BasicObject.send :include, DashedMap

## Why does it return an array?

I don't know.

## How does it decide where to put dashes?

Good question.
