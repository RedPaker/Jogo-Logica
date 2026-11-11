if (sumindo == true) {
    alfa -= 0.02; 

    // Quando a transparência chegar a zero ou menos, destrói o objeto
    if (alfa <= 0.05) {
        instance_destroy();
    }
}