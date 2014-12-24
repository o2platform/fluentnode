<!--
the style tag below will hide the default docco title which in the current page is
index.md and doesn't make sense to show
-->
<style type="text/css">
  #title      { display : none; }
</style>

NodeJS's [FluentNode](https://github.com/o2platform/fluentnode) is a set of Fluent apis for node applications (based on the concepts used in O2 Platforms C#'s FluentSharp APIs) and
similar to UnderscoreJS except that FluentNode actualy extends the target Javascript objects)

## Install
To use clone the [GitHub repo](https://github.com/o2platform/fluentnode) or install using
```
npm install fluentnode --save
```

## Annotated source code

The  extensions/protototypes are included the following files (and tests):

####Core Javascript classes

* [Array](Array.html) ([tests](Array.test.html))
* [Boolean](Boolean.html)
* [Function](Function.html)
* [Number](Number.html)
* [Object](Object.html)
* [String](String.html)

####Node classes

* [console](console.html)
* [fs](fs.html)
* [http](http.html)
* [path](path.html)
* [process](process.html)

####Assert helpers

* [assert Array](assert_Array.html)
* [assert Boolean](assert_Boolean.html)
* [assert Function](assert_Function.html)
* [assert Number](assert_Number.html)
* [assert Object](assert_Object.html)
* [assert String](assert_String.html)

#### Other files

* [_register.js](_register.html)