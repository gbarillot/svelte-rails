<script>
export let name;
export let preview;
export let placeholder;
export let callback;
export let tooltip;

const convertBase64 = (file) => {
  return new Promise((resolve, reject) => {
    const fileReader = new FileReader();
    fileReader.readAsDataURL(file);

    fileReader.onload = () => {
      resolve(fileReader.result);
    };

    fileReader.onerror = (error) => {
      reject(error);
    }
  })
}

function load(e) {
  e.preventDefault();
  document.getElementById('poster-handler').click();
}

const uploadImage = async (event) => {
  const file = event.target.files[0];
  const base64 = await convertBase64(file);
  name = base64;
  preview = base64;
  callback(name, preview);
}

function clearPoster(e) {
  e.preventDefault();
  name = null;
  preview = '';  
  callback(null, '');
}
</script>

<style>
a.delete {
  display: online-block;
  position: absolute;
  background-color: red;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  right: 10px;
  top: 40px;
  text-align: center;
  color: #fff;
  font-size: 30px;
  line-height: 36px;
  z-index: 20;
  text-decoration: none !important;
  cursor: pointer;
  font-weight: 200;
}

a.delete:hover {
  font-weight: 10;
}

.preview {
  width: 100%;
  min-height: 200px;
  border: 1px solid #ddd;
  display: block;
  position: relative;
}

.preview span.placeholder {
  z-index: 10;
  position: absolute;
  display: block;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  text-align: center;
  padding: 20px;
  padding-top: 20%;
  font-size: 25px;
  font-weight: lighter;
}

.preview span.placeholder.hidden {
  display: none;
}

.preview img {
  width: 100%;
}

input {
  opacity: 0;
  height: 0px;
}
</style>

<div class="uploader">
  <a class="delete" href="#/" class:hidden={preview == ''} title={ tooltip } on:click={clearPoster}>×</a>
  <a class="preview" on:click={load} href='#/' aria="uploader">
      <span class="placeholder" class:hidden={preview != ''}>{placeholder}</span>
      <img class="img" src={preview} alt="preview" class:hidden={preview == ''}/>
  </a>
  <input id="poster-handler" type="file" bind:value={name} on:change={uploadImage}>
</div>