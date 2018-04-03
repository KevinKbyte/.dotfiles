const activate = (oni) => {
    // access the Oni plugin API here

    // for example, unbind the default `<c-p>` action:
    oni.input.unbind("<c-p>")

    // or bind a new action:
    oni.input.bind("<c-enter>", () => alert("Pressed control enter"));
    oni.input.bind("<s-c-h>", () => alert("yo"));

}

module.exports = {
    activate,
    // change configuration values here:
    "oni.useDefaultConfig": true,
    "oni.loadInitVim": true,
    "editor.fontSize": "16px",
    "editor.fontFamily": "Monospace",
    "editor.completions.enabled": true,
    "ui.colorscheme": "Monokai",
    "ui.animations.enabled": false,
    "editor.quickInfo.delay": 10,
    "editor.completions.mode": 'native',
    "oni.useExternalPopupMenu": true,
    "oni.hideMenu": true, // Hide default menu, can be opened with <alt>


}

