import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Shopping abroad?", "Reclaim VAT with"],
    typeSpeed: 70,
    loop: false
  });
}

export { loadDynamicBannerText };
