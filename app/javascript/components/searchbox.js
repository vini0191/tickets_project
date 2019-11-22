const input = document.getElementById('event_location');

const initInput = () => {
  input.addEventListener('change', event => {
    // console.log(event)
    console.log(event.target.value);
  });
}

export { initInput };