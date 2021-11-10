'use strict'

// Main file that webpack uses to compile the entire thing

import './ticker.scss';
import { Elm } from './Main.elm';


// This isn't necessary during development because the element we're querying is hardcoded in the index.html
// In production (on Squarespace), it is dynamically loaded in, so we need to wait for it to be ready
// Unfortunately, this is not an elegant solution.
// We are essentially querying the DOM every 100ms to see if the element appears
// A better solution (MutationObserver) doesn't work for some reason. Not sure why.

// Check the notes on this commit: https://github.com/e3c-summer-worker/custom-header/commit/12efa0448f257f30384f48aecd965c901ecb122d#diff-08b6348aac7674f385f189b3571f925e3a843f0b519955cba797d854541f0c0e
window.onload = () => {
    // waits until the element is on the DOM, ready for Elm to be initialized
    const elementExists = setInterval(() => {
        const elem = document.querySelector('.sqs-slice-group.group-copy.align-center-vert.full-width');
        if (elem != null) {
            console.log('Found element');
            clearInterval(elementExists);
            initializeElm(elem);
        }
    }, 100);
}

const initializeElm = (elem) => {
    // create <div> element with id "elm"
    // this is used by the scss to ensure we have the height set properly when we initialize
    const elm = document.createElement('div');
    elm.setAttribute('id', 'elm');

    // insert as the first child of the element
    // https://developer.mozilla.org/en-US/docs/Web/API/Element/insertAdjacentElement
    elem.insertAdjacentElement('afterbegin', elm);
    Elm.Main.init({ node: elm });
};
