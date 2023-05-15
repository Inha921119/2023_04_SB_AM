function ToastEditor__init() {
  $('.toast-ui-editor').each(function(index, node) {
    const $node = $(node);
    const $initialValueEl = $node.find(' > script');
    const initialValue = $initialValueEl.length == 0 ? '' : $initialValueEl.html().trim();

    const editor = new toastui.Editor({
      el: node,
      previewStyle: 'vertical',
      initialValue: initialValue,
      height:'600px',
      plugins: []
    });

    $node.data('data-toast-editor', editor);
  });
}

function ToastEditorView__init() {
  $('.toast-ui-viewer').each(function(index, node) {
    const $node = $(node);
    const $initialValueEl = $node.find(' > script');
    const initialValue = $initialValueEl.length == 0 ? '' : $initialValueEl.html().trim();
    $node.empty();

    var viewer = new toastui.Editor.factory({
      el: node,
      initialValue: initialValue,
      viewer:true,
      plugins: []
    });

    $node.data('data-toast-editor', viewer);
  });
}

$(function() {
  ToastEditor__init();
  ToastEditorView__init();
});