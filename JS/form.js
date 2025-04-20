class CartItem{
    constructor(name, desc, img, price){
        this.name = name
        this.desc = desc
        this.img=img
        this.price = price
        this.quantity = 1
   }
  }
  
  class LocalCart{
    static key = "cartItems"
  
    static getLocalCartItems(){
        let cartMap = new Map()
     const cart = localStorage.getItem(LocalCart.key)   
     if(cart===null || cart.length===0)  return cartMap
        return new Map(Object.entries(JSON.parse(cart)))
    }
  
    static addItemToLocalCart(id, item){
        let cart = LocalCart.getLocalCartItems()
        if(cart.has(id)){
            let mapItem = cart.get(id)
            mapItem.quantity +=1
            cart.set(id, mapItem)
        }
        else
        cart.set(id, item)
       localStorage.setItem(LocalCart.key,  JSON.stringify(Object.fromEntries(cart)))
       updateCartUI()
  
    }
  
    static removeItemFromCart(id){
    let cart = LocalCart.getLocalCartItems()
    if(cart.has(id)){
        let mapItem = cart.get(id)
        if(mapItem.quantity>1)
       {
        mapItem.quantity -=1
        cart.set(id, mapItem)
       }
       else
       cart.delete(id)
    } 
    if (cart.length===0)
    localStorage.clear()
    else
    localStorage.setItem(LocalCart.key,  JSON.stringify(Object.fromEntries(cart)))
       updateCartUI()
    }
  }
  
  
  const cartIcon = document.querySelector('.fa-cart-arrow-down')
  const wholeCartWindow = document.querySelector('.whole-cart-window')
  wholeCartWindow.inWindow = 0
  const addToCartBtns = document.querySelectorAll('.add-to-cart-btn')
  addToCartBtns.forEach( (btn)=>{
    btn.addEventListener('click', addItemFunction)
  }  )
  
  function addItemFunction(e){
    const id = e.target.parentElement.parentElement.parentElement.getAttribute("data-id")
    const img = e.target.parentElement.parentElement.previousElementSibling.src
    const name = e.target.parentElement.previousElementSibling.textContent
    const desc = e.target.parentElement.children[0].textContent
    let price = e.target.parentElement.children[1].textContent
    price = price.replace("Price: $", '')
    const item = new CartItem(name, desc, img, price)
    LocalCart.addItemToLocalCart(id, item)
  console.log(price)
  }
  
  // Show the cart permanently when the cart icon is clicked
  cartIcon.addEventListener('click', () => {
    wholeCartWindow.classList.remove('hide');
    wholeCartWindow.inWindow = 1; // Ensure the cart remains visible
  });
  
  cartIcon.addEventListener('mouseover', ()=>{
  if(wholeCartWindow.classList.contains('hide'))
  wholeCartWindow.classList.remove('hide')
  })
  
  cartIcon.addEventListener('mouseleave', ()=>{
    // if(wholeCartWindow.classList.contains('hide'))
    setTimeout( () =>{
        if(wholeCartWindow.inWindow===0){
            wholeCartWindow.classList.add('hide')
        }
    } ,500 )
  
    })
  
  wholeCartWindow.addEventListener('mouseover', ()=>{
     wholeCartWindow.inWindow=1
  })  
  
  wholeCartWindow.addEventListener('mouseleave', ()=>{
    wholeCartWindow.inWindow=0
    wholeCartWindow.classList.add('hide')
  })  
  
  
  function updateCartUI(){
    const cartWrapper = document.querySelector('.cart-wrapper')
    cartWrapper.innerHTML=""
    const items = LocalCart.getLocalCartItems()
    if(items === null) return
    let count = 0
    let total = 0
    for(const [key, value] of items.entries()){
        const cartItem = document.createElement('div')
        cartItem.classList.add('cart-item')
        let price = value.price*value.quantity
        price = Math.round(price*100)/100
        count+=1
        total += price
        total = Math.round(total*100)/100
        cartItem.innerHTML =
        `
        <img src="${value.img}"> 
                       <div class="details">
                           <h3>${value.name}</h3>
                           <p>${value.desc}
                            <span class="quantity">Quantity: ${value.quantity}</span>
                               <span class="price">Price: $ ${price}</span>
                           </p>
                       </div>
                       <div class="cancel"><i class="fas fa-window-close"></i></div>
        `
       cartItem.lastElementChild.addEventListener('click', ()=>{
           LocalCart.removeItemFromCart(key)
       })
        cartWrapper.append(cartItem)
    }
  
    if(count > 0){
        cartIcon.classList.add('non-empty')
        let root = document.querySelector(':root')
        root.style.setProperty('--after-content', `"${count}"`)
        const subtotal = document.querySelector('.subtotal')
        subtotal.innerHTML = `SubTotal: $${total}`
    }
    else
    cartIcon.classList.remove('non-empty')
  }
  document.addEventListener('DOMContentLoaded', ()=>{updateCartUI()})
  
  
  
  
  
  
  
  
  
  
  
  document.addEventListener('DOMContentLoaded', () => {
    updateCartUI();
  
    // Attach click event to "Buy Now" buttons
    const buyButtons = document.querySelectorAll('.buy');
    buyButtons.forEach(button => {
        button.addEventListener('click', (event) => {
            event.preventDefault(); // Prevent default navigation to form.html
  
            const cardItem = button.closest('.card-item');
  
            // Find the "Add To Cart" span within the same card
            const addToCartSpan = cardItem.querySelector('.add-to-cart-btn');
            if (addToCartSpan) {
                // Simulate a click on the "Add To Cart" span
                addToCartSpan.click();
            }
  
            // Redirect to form.html after adding to cart
            window.location.href = 'form.html';
        });
    });
  
    // Attach click event to "Add To Cart" spans
    const addToCartBtns = document.querySelectorAll('.add-to-cart-btn');
    addToCartBtns.forEach((btn) => {
        btn.addEventListener('click', addItemFunction);
    });
  });
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  document.addEventListener('DOMContentLoaded', () => {
    const submitButton = document.getElementById('submit');
  
    if (submitButton) {
        submitButton.addEventListener('click', (event) => {
            event.preventDefault(); // Prevent the default form submission
            console.log('Submit button clicked');
            sendCartToServer();
        });
    } else {
        console.error('Submit button not found');
    }
  });
  
document.addEventListener('DOMContentLoaded', () => {
    // Handling the Submit Button (form.html)
    const submitButton = document.getElementById('submit');
    if (submitButton) {
        submitButton.addEventListener('click', (event) => {
            event.preventDefault(); // Prevent default form submission
            console.log('Submit button clicked');
            sendCartToServer();
        });
    } else {
        console.warn('Submit button not found on this page');
    }

    // Handling the Whole Cart Window (product.html)
    const wholeCartWindow = document.querySelector('.whole-cart-window');
    if (wholeCartWindow) {
        wholeCartWindow.inWindow = 0;

        wholeCartWindow.addEventListener('mouseover', () => {
            wholeCartWindow.inWindow = 1;
        });

        wholeCartWindow.addEventListener('mouseleave', () => {
            wholeCartWindow.inWindow = 0;
            wholeCartWindow.classList.add('hide');
        });
    } else {
        console.warn('.whole-cart-window element not found on this page');
    }
});



  function sendCartToServer() {
    console.log('Executing sendCartToServer');
  
    const cart = LocalCart.getLocalCartItems();
    const cartItems = Array.from(cart.values());
    console.log('Cart Items:', cartItems);
  
    fetch('connectcart.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(cartItems)
    })
    .then(response => response.text())
    .then(data => {
        console.log('Cart data sent successfully:', data);
        alert('Cart data submitted and cart cleared!');
        LocalCart.clearLocalCart();
        updateCartUI();
    })
    .catch(error => {
        console.error('Error sending cart data:', error);
    });
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  function openModal(productId) {
    var modal = document.getElementById(productId);
    modal.style.display = "block";
  }
  
  function closeModal(productId) {
    var modal = document.getElementById(productId);
    modal.style.display = "none";
  }
  
  window.onclick = function(event) {
    var modals = document.getElementsByClassName('modal');
    for (var i = 0; i < modals.length; i++) {
        if (event.target == modals[i]) {
            modals[i].style.display = "none";
        }
    }
  }
  



























  // Add event listeners to the Buy Now buttons
const buyNowBtns = document.querySelectorAll('.buy');
buyNowBtns.forEach((btn) => {
    btn.addEventListener('click', (e) => {
        // Find the "Add to Cart" span in the same card item
        const addToCartSpan = e.target.closest('.card-item').querySelector('.add-to-cart-btn');
        
        if (addToCartSpan) {
            // Simulate a click on the "Add to Cart" span
            addToCartSpan.click();

            // Proceed to checkout or any additional functionality
            alert('Product added to cart. Proceeding to checkout...');
            window.location.href = 'form.html'; // Redirect to your checkout page
        } else {
            console.error('Add to Cart span not found!');
        }
    });
});