
const editor = CodeMirror.fromTextArea(document.getElementById("code"), {
   lineNumbers: true,
   styleActiveLine: true,
   matchBrackets: true
});
const input = document.getElementById("select");
function selectTheme() {
   const theme = input.options[input.selectedIndex].textContent;
   editor.setOption("theme", theme);
   location.hash = "#" + theme;
}
const theme_choice = (location.hash && location.hash.slice(1)) ||
   (document.location.search &&
      decodeURIComponent(document.location.search.slice(1)));
if (theme_choice) {
   input.value = theme_choice;
   editor.setOption("theme", theme_choice);
}
CodeMirror.on(window, "hashchange", function() {
   const theme = location.hash.slice(1);
   if (theme) { input.value = theme; selectTheme(); }
});