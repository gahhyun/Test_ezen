package kr.co.ezenac.JAVA_INTERFACE_IMPLEMENT;

public interface IList <T>{ //인터페이스를 <>제네릭을 이용해 타입을 객체를 생성할 때 정하도록 함

    void add(T t);  //T타입의 매개변수t를 가지는 추상메서드

    void insert(int index, T t);    //정수형의 인덱스번호와, T타입의 매개변수t를 받는 추상메서드

    void clear();   //반환타입과 매개변수가 없는 추상메서드

    boolean delete(T t);    //T타입의 매개변수t를 가지며 반환타입이 T/F인 추상메서드

    boolean deleteByIndex(int index);   //인덱스 번호를 매개변수를 가지며 반환타입이 T/F인 추상메서드

    T get(int index) ;   //인덱스 번호를 매개변수로 받는 T타입의 추상메서드

    int indexOf(T t);   //T타입의 매개변수t를 가지며 정수를 반환하는 추상메서드

    boolean isEmpty();  //매개변수는 없고 반환타입은 T/F인 추상메서드

    boolean contains(T t);  //T타입의 매개변수t를 가지며 반환타입이 T/F인 추상메서드

    int size();     //매개변수는 없으며 정수형을 반환하는 추상메서드

    void printAll();    //반환타입과 매개변수 모두 없는 추상메서드






}
