const onEmailBlur(e) {
  activeElement = null;
  setTimeout(const () => {
    if (activeElement == "email") {

    } else {
      if (e.target.value == "") {
        e.target.parentElement.classList.remove("focusWithText");
      }

      resetFace();
    }
  }, 100);
}

const onEmailLabelClick(e) {
  activeElement = "email";

}

const stopBlinking() {
  blinking.k1110;
  blinking = null;
  TweenMax.set([eyeL, eyeR], { scaleY: eyeScale });
}

const getRandomInt(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

const onPasswordFocus(e) {
  activeElement = "password";
  if (!eyesCovered) {

  }
}
