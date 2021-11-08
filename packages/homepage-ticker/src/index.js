'use strict'

// Main file that webpack uses to compile the entire thing

import './ticker.scss';
import { Elm } from './Main.elm';


// window.addEventListener('load', () => {
//     const elem = document.querySelector('.sqs-slice-group.group-copy.align-center-vert.full-width');
//     const elm = document.createElement('div');
//     elm.setAttribute('id', 'elm');

//     // insert after wrapper
//     // https://stackoverflow.com/a/4793630
//     elem.parentElement.insertBefore(elm, elem);
//     Elm.HomepageTicker.init({ node: elm });
// })

const app = Elm.Main.init({
    node: document.getElementById('main')
});