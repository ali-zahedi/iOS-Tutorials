#include <iostream>
using std::cout;
using std::endl;

#include <iomanip>
using std::setw;

void arrayModified(int []);

int main()
{
    int b[] = { 10, 20, 30, 40 }; // create 4-element array b
    int *bPtr = b; // set bPtr to point to array b

    // output array b using array subscript notation
    cout << "Array b printed with:\n\nArray subscript notation\n";

    for ( int i = 0; i < 4; i++ )
        cout << "b[" << i << "] = " << b[ i ] << '\n';

    // output array b using the array name and pointer/offset notation
    cout << "\nPointer/offset notation where "
    << "the pointer is the array name\n";

    for ( int offset1 = 0; offset1 < 4; offset1++ )
        cout << "*(b + " << offset1 << ") = " << *( b + offset1 ) << '\n';

    cout << setw( 50 ) << "first array element address is ( b ):" << setw( 20 ) << b << endl;
    cout << setw( 50 ) << "address b is:" << setw( 20 ) << &b << endl;
    cout << setw( 50 ) << "first array element value is ( b ):" << setw( 20 ) << *b << endl;
    cout << setw( 50 ) << "first array element address is ( bPtr ):" << setw( 20 ) << bPtr << endl;
    cout << setw( 50 ) << "address bPtr is:" << setw( 20 ) << &bPtr << endl;
    cout << setw( 50 ) << "first array element value is ( bPtr ):" << setw( 20 ) << *bPtr << endl;

    // pass to function
    arrayModified( b );


    // output array b using bPtr and array subscript notation
    cout << "\nPointer subscript notation\n";

    for ( int j = 0; j < 4; j++ )
        cout << "bPtr[" << j << "] = " << bPtr[ j ] << '\n';

    cout << "\nPointer/offset notation\n";

    // output array b using bPtr and pointer/offset notation
    for ( int offset2 = 0; offset2 < 4; offset2++ )
        cout << "*(bPtr + " << offset2 << ") = "
        << *( bPtr + offset2 ) << '\n';


    return 0; // indicates successful termination
} // end main

void arrayModified(int bPtrFunc[]){

    cout << setw( 50 ) << "first array element address is ( bPtrFunc ):" << setw( 20 ) << bPtrFunc << endl;
    cout << setw( 50 ) << "address bPtrFunc is:" << setw( 20 ) << &bPtrFunc << endl;
    cout << setw( 50 ) << "first array element value is ( bPtrFunc ):" << setw( 20 ) << *bPtrFunc << endl;

    cout << "Print in function array modified" << endl;

    for (int i = 0 ; i < 4; i++) {
        bPtrFunc[ i ]++;
        cout << "bPtr[" << i << "] = " << bPtrFunc[ i ] << endl;
    }


}