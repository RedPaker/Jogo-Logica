if (variable_global_exists("partTypeConfetti") && part_type_exists(global.partTypeConfetti)) {
    part_type_destroy(global.partTypeConfetti);
}

if (variable_global_exists("partSystemConfetti") && part_system_exists(global.partSystemConfetti)) {
    part_system_destroy(global.partSystemConfetti);
}
