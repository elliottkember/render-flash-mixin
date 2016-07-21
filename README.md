# render-flash-mixin
A React mixin for visualising component rendering.

Ever wondered what your React components are really up to? This handy mixin allows you to highlight your components every time they call componentDidUpdate and componentDidMount. This makes it much easier to spot components that are rendering themselves unnecessarily and causing performance bottlenecks.

![Animated demo](demo.gif)

# Usage
```coffeescript
MyComponent = React.createClass
  mixins: [RenderFlashMixin]
```
# Monkey-patching usage
This automagically applies this mixin to all your React components.

```coffeescript
originalReactClass = React.createClass
React.createClass = (obj) ->
  obj.mixins = obj.mixins || []
  obj.mixins.push(RenderFlashMixin)
  originalReactClass(obj)
```
# Green everywhere?
If your components are calling componentDidUpdate too often, you may want to implement [shouldComponentUpdate](http://buildwithreact.com/article/optimizing-with-shouldcomponentupdate).
# Red everywhere?
If your components are calling componentDidMount too often, you may not have specified a ["key" attribute](http://blog.arkency.com/2014/10/react-dot-js-and-dynamic-children-why-the-keys-are-important/). Otherwise, your components may be removed and reinitialized between renders.
