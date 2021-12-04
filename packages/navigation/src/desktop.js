import { Elm } from './DesktopNav.elm';


window.addEventListener('load', () => {
    const headerNav = document.getElementById('headerNav');
    Elm.DesktopNav.init({ node: headerNav });
})
