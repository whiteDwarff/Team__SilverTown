


	console.log(1)
    var htmlEditor = CodeMirror(document.getElementById("html-editor"), {
      value: "<!DOCTYPE html>\n<html>\n<head>\n  <title>My Page</title>\n</head>\n<body>\n  <h1>Hello, World!</h1>\n</body>\n</html>",
      mode: "htmlmixed",
      theme: "default",
      tabSize: 2,
      lineNumbers: true,
    });

    var cssEditor = CodeMirror(document.getElementById("css-editor"), {
      value: "h1 {\n  color: red;\n}",
      mode: "css",
      theme: "default",
      tabSize: 2,
      lineNumbers: true,
    });

    var jsEditor = CodeMirror(document.getElementById("js-editor"), {
      value: "console.log('Hello, World!');",
      mode: "javascript",
      theme: "default",
      tabSize: 2,
      lineNumbers: true,
    });

    $('#run-button').click(function() {
      var html = htmlEditor.getValue();
      var css = cssEditor.getValue();
      var js = jsEditor.getValue();
      var iframe = $('<iframe></iframe>');
      $('body').append(iframe);
      var iframeDocument = iframe[0].contentWindow.document;
      iframeDocument.open();
      iframeDocument.write(html);
      iframeDocument.write('<style>' + css + '</style>');
      iframeDocument.write('<script>' + js + '</script>');
      iframeDocument.close();
    });
