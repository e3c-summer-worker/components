import { Elm } from './MobileNav.elm';


window.addEventListener('load', () => {
    const sidecarNav = document.getElementById('sidecarNav');
    Elm.MobileNav.init({ node: sidecarNav });
})
