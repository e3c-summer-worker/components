# Navigations

Making our custom headers is a bit involved. We have to copy a lot of HTML code
into the scripts, and it's confusing and difficult to debug if something changes
and goes wrong, especially if our only text editor is the one built into
Squarespace.

Making the navigation in another component where you ethen import it is easier to debug and move around;
you copy less code between pages and the development process is better if you're
using something like VSCode.

We are using this folder to specifically host the desktop and mobile navigation component,
that goes inside `#headerNav` and `#sidecarNav` in the Squarespace page, respectively.

The header code in `public/index.html` is almost exactly what you'd see copy and
pasted into Squarespace (instead of importing the local `.js` file we use
[JSDelivr](https://www.jsdelivr.com/), and we need to add the contents in and [`styles.css`](./public/styles.css)). 

## Important

The [`site.css`](./public/site.css) is the squarespace compiled css, and the [`styles.css`](./public/styles.css) are our styles.

## Local Development

## Production

Similar to the Scrolling Terrain Background, we are using Github Actions to deploy the build to a new branch (`navigation`). On the Squarespace site,
we use jsDelivr to retrieve the files. You can access the files at this link:

- [https://cdn.jsdelivr.net/gh/e3c-summer-worker/components@navigation/desktopnav-elm.js](https://cdn.jsdelivr.net/gh/e3c-summer-worker/components@scrolling-terrain/desktopnav-elm.js).
- [https://cdn.jsdelivr.net/gh/e3c-summer-worker/components@navigation/mobilenav-elm.js](https://cdn.jsdelivr.net/gh/e3c-summer-worker/components@scrolling-terrain/mobilenav-elm.js).
