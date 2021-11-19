
const accordianItemHeaders = document.querySelectorAll(".accordion-item-header");

accordianItemHeaders.forEach(accordianItemHeader => {
    accordianItemHeader.addEventListener("click", event => {

        const accordianItemHeaderActive = document.querySelector(".accordion-item-header.active")
        if(accordianItemHeaderActive && accordianItemHeaderActive !== accordianItemHeader) {
            accordianItemHeaderActive.classList.toggle("active");
            accordianItemHeaderActive.nextElementSibling.style.maxHeight = 0;
        }

        accordianItemHeader.classList.toggle("active");
        const accordionItemBody = accordianItemHeader.nextElementSibling;
        if(accordianItemHeader.classList.contains("active")) {
            accordionItemBody.style.maxHeight = accordionItemBody.scrollHeight + "px";
        }
        else {
            accordionItemBody.style.maxHeight = 0;
        }
    });
});

