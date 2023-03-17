package kr.co.ezenac.JAVA_INTERFACE_IMPLEMENT;

import java.util.Arrays;
/*
//IList인터페이스를 구현하는 클래스이며 <>으로 지정
//<>제네릭 : 특정 타입을 미리 지정해주는 것이 아닌 필요에 의해 지정할 수 있도록 하는 일반(Generic) 타입이라는 것
 */
public class MyArrayList<T> implements IList<T>{

    private static final int DEFAULT_SIZE = 50;     //상수선언

    private  int size;      //정수형 size 선언

    private  T[] elements;      //T타입의 배열, 배열명 elements로 선언

    public  MyArrayList(){                                   //매개변수가 없는 생성자
        this.size = 0;                                      //size을 0으로 초기화
        this.elements = (T[]) new Object[DEFAULT_SIZE];     ////elements을 T타입의 배열로 받는 최상위클래스인 Object[50]배열로 초기화
    }

    @Override
    //elements을 T타입의 배열로 받는 최상위클래스인 Object[50]배열을 선언
    public void add(T t) {
        //선언된 size와 elements배열의 길이가 같을 경우, 즉 길이가 50일 경우(50이 다차서 51이 들어가야 할 상황)
        if(this.size == this.elements.length){
            //elements의 베열의 길이를 size의 길이의 2배를 해라 즉,길이가 100인 배열이 생성
            this.elements = Arrays.copyOf(this.elements, this.size*2);
        }
        //if가 아니라면 elements의 배열에 매개변수 t를 마지막배열 순서에 넣는다
        this.elements[this.size] = t;
        //for문을 돌면서 size(배열의 크기)가 하나씩 증가
        this.size +=1;
    }

    @Override
    //메개변수t를 지정하는 인덱스번호에 넣는 메서드
    public void insert(int index, T t) {
        //선언된 size와 elements배열의 길이가 같을 경우, 즉 길이가 50일 경우(50이 다차서 51이 들어가야 할 상황)
        if(this.size == this.elements.length){
            //elements의 베열의 길이를 size의 길이의 2배를 해라 즉,길이가 100인 배열이 생성
            this.elements = Arrays.copyOf(this.elements, this.size*2);
        }
        //사이즈는 1부터 배열은0부터여서 size-1이다
        //if가 아니라면 i는 배열의 크기부터 매개변수인 index까지 하나씩 줄어들면서
        for(int i=size-1; i>=index; i--){
            //만약 배열의 크기(size)가 5이고 추가하는 인덱스가3이면 마지막번호부터 하나씩 커진다
            //즉, 마지막인덱스번호였던 4는 5가되고 3은 4가된다 이렇게 하나씩 커진다
            this.elements[i+1] = this.elements[i];
        }
        //예를 들어 매개변수로 받아 추가하는 인덱스 번호가 3일때 값은 매개변수t이다
        this.elements[index] = t;
        //주어진 매개값을 배열에 넣었기 때문에 배열의 size는 1씩 증가한다
        this.size++;

    }

    @Override
    //배열안의 데이터를 전부 삭제하는 메서드
    public void clear() {
        //배열의 길이 = 0
        this.size = 0;
        //다시 초기화 시킴
        this.elements = (T[]) new Object[DEFAULT_SIZE];

    }

    @Override
    //매개변수t를 배열안에서 삭제하는 메서드
    public boolean delete(T t) {
        //0부터 하나씩 size-1까지 돌면서
        for(int i=0; i<this.size; i++){
            //만약 배열elements의 i번째가 매개값으로 주어진 t와 동일하다면
            if(this.elements[i].equals(t)){
                //매개변수t를 가진 인덱스번호부터 배열의 크기까지 1씩 증가하면서
                for(int j=i; j<this.size-1; j++){
                    //삭제된 인덱스번호 뒤부터 하나씩 인덱스번호가 -1이 된다
                    //예로 배열의 크기가4이고 i가1이면 2였던 인덱스번호의 값의 인덱스번호는 1이되고 3은 2가 된다
                    this.elements[j] = this.elements[j+1];
                }
                //배열안의 값 하나가 삭제되기 때문에 배열의 크기(size)는 1씩 감소한다
                this.size--;
                return true;
            }
        }
        return false;
    }

    @Override
    //매개값으로 주어진 index번호의 값을 삭제하는 메서드
    public boolean deleteByIndex(int index) {
        //만약 매개변수로 받은 인덱스번호가 0보다작고 배열의크기보다 크면 false를 리턴한다
        if(index<0 || index>this.size-1){
            return false;
        }
        //매개변수로 받은 index의 번호부터 배열의 크기까지 1씩 증가하면서
        for(int i=index; i<this.size-1; i++){
            //인덱스번호가 1씩 감소된다
            this.elements[i] = this.elements[i+1];
        }
        //배열의 값을 삭제했기 때문에 배열의 크기는 1씩 감소된다
        this.size--;
        return true;
    }

    @Override
    //T타입으로 선언된 배열안에서 매개변수로 주어진 인덱스번호에 맞는 값을 리턴하는 메서드
    public T get(int index) {
        //만약 매개변수로 받은 인덱스의 번호가 0보다 작고 배열의 크기보다 크면
        if(index<0 || index>this.size-1) {
            //예외처리로 던져버린다
            throw new IndexOutOfBoundsException();
        }
        //그렇지 않다면 배열elements의 매개값으로 주어진 인덱스번호에 맞는 값을 리턴한다
        return this.elements[index];
    }

    @Override
    //매개변수로 주어진 t를 배열안에서 찾아 t의 인덱스번호를 리턴하는 메서드
    public int indexOf(T t) {
        //0부터 배열의 크기만큼 1씩 증가하면서
        for(int i=0; i<this.size; i++){
            //만약 배열의 i와 매개변수로 주어진t의 값이 동일하다면
            if(this.elements[i].equals(t)){
                //그때의 인덱스 번호를 리턴해라
                return i;
            }
        }
        //그렇지 않으면 -1를 리턴
        return -1;
    }

    @Override
    //배열의 안의 값이 존재하는 T/F로 확인하는 메서드
    public boolean isEmpty() {
        //배열안에 값이 없을때 (참) 을 리턴한다
        return this.size ==0;
    }

    @Override
    //매개변수t가 배열안에 있는지 확인하는 메서드
    public boolean contains(T t) {
        //0부터 배열의크기만큼 1씩 증가하면서
        for(int i=0; i<this.size; i++){
            //만약 배열의 i번째와 매개변수t가 동일하다면
            if(this.elements[i].equals(t))
                //true를 리턴한다
                return true;
        }
        return false;
    }

    @Override
    //배열의 크기를 정수로 리턴하는 메서드
    public int size() {
        //배열의 크기를 리턴한다
        //배열의 인덱스번호는 0부터이고 배열의크기는 1부터 이다
        return this.size;
    }

    @Override
    //배열안의 값들을 출력해주는 메서드
    public void printAll() {
        //만약 isEmpty가 참이라면 즉, 배열안에 값이 없다면
        if(isEmpty()==true){
            //"출력할 내용이 없습니다"를 출력한다
            System.out.println("출력할 내용이 없습니다.");
        }
        //값이 있다면 0부터 배열의 크기만큼 1씩 증가하면서
        for(int i=0; i<this.size; i++){
            //배열안의 값들을 한칸씩 띄워 출력한다
            System.out.print(elements[i] + " ");
        }
        System.out.println();
    }



}
