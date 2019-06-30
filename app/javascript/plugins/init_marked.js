import marked from 'marked';

const initMarked = () => {
  const textarea = document.getElementById('editor');
  const preview = document.getElementById('preview');

  if (textarea && preview) {
    textarea.addEventListener('keyup', (event) => {
      const html = marked(textarea.value);
      preview.innerHTML = html;
    });
  }
};

export { initMarked };
