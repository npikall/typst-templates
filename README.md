# Typst Templates

This repository contains templates for my personal typst projects. The templates are inspired by LaTeX Templates.

As I am fairly new to ``typst`` my templates will be very basic, but they fit my needs. I will try to keep them as simple as possible, but also as flexible as possible. As of now it is not my intention to have them available in the `typst universe`, because I want the templates to be easily customizable.

## Compilation 
To compile the templates use the following command if not automatically done by your editor:
```bash
typst compile dev.typ <output_name>
```

## Useage of the Templates
Have the template (e.g. `config.typ`) in the same directory as your project and include it in your main file with the following command:

```typst
#import "config.typ": conf, maketitle
```
This will load the `conf` and the `maketitle` function from the template. You can now use them in your project.

Use the `conf` function to set the general style of your document. This function might have some additional parameters, which you can find in the template file.
```typst
#show: doc => conf(doc)
```
After that use the `maketitle` function to create the title section or page of your document. This function might have some additional parameters, which you can find in the template file aswell.
```typst
#maketitle(
  title: [The title of your document],
  author: [The authors name],
  date: [The date],
)
```