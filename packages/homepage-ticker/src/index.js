'use strict'

// Main file that webpack uses to compile the entire thing

import './ticker.scss';
import { Elm } from './Main.elm';

window.addEventListener('load', () => {
    const elem = document.querySelector('.sqs-slice-group.group-copy.align-center-vert.full-width');
    // create <div> element with id "elm"
    // this is used by the scss to ensure we have the height set properly when we initialize
    const elm = document.createElement('div');
    elm.setAttribute('id', 'elm');

    // insert as the first child of the element
    // https://developer.mozilla.org/en-US/docs/Web/API/Element/insertAdjacentElement
    elem.insertAdjacentElement('afterbegin', elm);
    Elm.Main.init({ node: elm });
})
