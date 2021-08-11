# Kids Navigations

This is the navigation bar used for the ECCC kids website. I used [Elm](https://elm-lang.org/) to create the component.

## Run Locally

**Disclaimer:** I ran this on MacOS fine, but the terminal commands may be different on Windows. I also used VSCode.

### Prerequisites

Using VSCode, you can quite easily install the necessary toolings to make it easier to work with Elm. 
I used the [Elm Tooling](https://marketplace.visualstudio.com/items?itemName=Elmtooling.elm-ls-vscode).

You can optionally [install Elm](https://elm-lang.org/) locally on your computer (I used version `0.19.1-5`), 
though this is not necessary as I added elm as an npm dependency.

#### Install dependencies

```bash
npm i
```

#### Start the code locally

```bash
npm run start
```

This should make Elm download the necessary dependencies in [`elm.json`](elm.json) and start a live server on [localhost:8000](http://localhost:8080/).
Note that the UI will not look exactly like the one you will see on Squarespace. They use some fonts that are paid, so I was unable to use them on this project.
The layout will be the same, though.

If you start a live server and then open `public/index.html` file in your browser, you should see the navigation bar. I personally use Ritwich Dey's [Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer) extension to start the server right in VSCode.

#### Build the code once changes are made

```bash
npm run build
```

This will compile and minify the code into `public/kidsnav-elm.js`. You can then copy that file to the `scripts/` folder in the [SummerWorkerECCC.github.io](https://github.com/SummerWorkerECCC/SummerWorkerECCC.github.io) repo.

