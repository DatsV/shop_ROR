const cartObj = JSON.parse(
  document.getElementById('session_cart').dataset.session,
);

function inputForPatch() {
  let input = document.createElement('input');
  input.setAttribute('type', 'hidden');
  input.setAttribute('name', '_method');
  input.setAttribute('value', 'patch');

  return input;
}

document.addEventListener('click', function (e) {
  if (!e.target.parentNode?.dataset?.form || e.target.type !== 'submit') {
    return;
  }

  e.preventDefault();

  const form = e.target.parentNode;
  const formData = new FormData(form);

  switch (e.target.parentNode.dataset.form) {
    case 'update_in_cart':
      for (let i = 0; i < cartObj.length; i++) {
        let cur = cartObj[i];

        if (cur.product_id === formData.get('product_id')) {
          cur.quantity = formData.get('quantity');
          changeCart(cartObj, form);
          return;
        }
      }

      break;

    case 'delete_in_cart':
      let isConfirm = confirm('Are you sure?');
      if (!isConfirm) {
        return;
      }

      for (let i = 0; i < cartObj.length; i++) {
        let cur = cartObj[i];

        if (cur.product_id === formData.get('product_id')) {
          cartObj.splice(i, 1);
          changeCart(cartObj, form);
          return;
        }
      }

      break;

    case 'add_to_cart':
      if (!cartObj) {
        addNewItemCart(form, formData);
        return;
      }

      for (let i = 0; i < cartObj.length; i++) {
        let cur = cartObj[i];

        if (cur.product_id === formData.get('product_id')) {
          cur.quantity = formData.get('quantity');
          form.appendChild(inputForPatch());
          changeCart(cartObj, form);
          return;
        }
      }

      addNewItemCart(form, formData);

      break;

    default:
      break;
  }
});

function addNewItemCart(form, formData) {
  const obj = {
    product_id: formData.get('product_id'),
    name: formData.get('product_name'),
    quantity: formData.get('quantity'),
    price: formData.get('product_price'),
  };

  changeCart(obj, form);
}

function changeCart(obj, form) {
  const dataField = form.querySelector('input[name=data]');
  dataField.value = JSON.stringify(obj);
  console.log(dataField);
  form.submit();
}
