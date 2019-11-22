import Inputmask from "inputmask";

const initInputMask = () => {
  const selector = document.querySelector(".currency");
  Inputmask({
    prefix: "$ ",
    groupSeparator: ".",
    alias: "numeric",
    digits: 2,
    digitsOptional: true
  }).mask(selector);
}

export { initInputMask };
