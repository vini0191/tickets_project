import Inputmask from "inputmask";

const initInputMask = () => {
  const selector = document.querySelector(".currency");
  if (selector){
    Inputmask({
      prefix: "$ ",
      groupSeparator: ".",
      alias: "numeric",
      digits: 2,
      digitsOptional: true
    }).mask(selector);
  }
}

export { initInputMask };
