#include <iostream>

/**
 * @brief very simple code to demonstrate concept
 */
int main(int argc, char** argv) {
    
    std::cout <<"hello world! This has been a test of dockerized c++ build!\n";
    for( int i=0; i<10; i++){
        std::cout << "\t cout = " << i << "\n";
    }
    std::cout <<"Done.\n";
}