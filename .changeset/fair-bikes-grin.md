---
"@e3c-summer-worker/navigation": major
---

Update bundler to use Webpack. This changes how it's used in production.

When you use it in production, only the import is needed. Inserting the element is handled by the code.

```html
<script src="https://cdn.jsdelivr.net/npm/@e3c-summer-worker/navigation@2/build/navigation.js"></script>
```
