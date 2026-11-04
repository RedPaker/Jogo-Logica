document.addEventListener("DOMContentLoaded", () => {

    const track = document.querySelector(".storyboard-track");
    const slides = document.querySelectorAll(".storyboard-slide");

    const prevButton = document.querySelector(".storyboard-prev");
    const nextButton = document.querySelector(".storyboard-next");

    const indicators = document.querySelector(".storyboard-indicators");

    let currentIndex = 0;

    // Verifica se os elementos existem
    if (!track || slides.length === 0 || !prevButton || !nextButton || !indicators) {
        console.error("Erro ao carregar o carrossel.");
        return;
    }

    // Cria os indicadores
    slides.forEach((slide, index) => {

        const button = document.createElement("button");

        button.type = "button";
        button.setAttribute("aria-label", `Ir para storyboard ${index + 1}`);

        button.addEventListener("click", () => {
            currentIndex = index;
            updateCarousel();
        });

        indicators.appendChild(button);

    });

    // Atualiza a posição das imagens
    function updateCarousel() {

        const slideWidth = track.clientWidth;

        track.style.transform = `translateX(-${currentIndex * slideWidth}px)`;

        const buttons = indicators.querySelectorAll("button");

        buttons.forEach((button, index) => {

            button.classList.toggle("active", index === currentIndex);

        });

    }

    // Próxima imagem
    nextButton.addEventListener("click", () => {

        currentIndex++;

        if (currentIndex >= slides.length) {
            currentIndex = 0;
        }

        updateCarousel();

    });

    // Imagem anterior
    prevButton.addEventListener("click", () => {

        currentIndex--;

        if (currentIndex < 0) {
            currentIndex = slides.length - 1;
        }

        updateCarousel();

    });

    // Recalcula quando a janela muda de tamanho
    window.addEventListener("resize", updateCarousel);

    updateCarousel();

    console.log("Carrossel iniciado com sucesso!");

});