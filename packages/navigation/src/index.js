import { Elm as DesktopElm } from './DesktopNav.elm';
import { Elm as MobileElm } from './MobileNav.elm';


window.onload = () => {
    // desktop navigation
    const headerNav = document.getElementById('headerNav');
    DesktopElm.DesktopNav.init({ node: headerNav });

    // mobile navigation
    const sidecarNav = document.getElementById('sidecarNav');
    MobileElm.MobileNav.init({ node: sidecarNav });
}
