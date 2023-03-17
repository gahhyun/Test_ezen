package kr.co.ezenac.JAVA_INTERFACE_IMPLEMENT;

public class MyArrayListTest {
    public static void main(String[] args)  {

        //Integer타입의 ezenList 객체 생성
        IList<Integer> ezenList = new MyArrayList<>();

        //데이터 삽입하기 (순차적 삽입)
        ezenList.add(100);
        ezenList.add(200);
        ezenList.add(300);
        ezenList.add(400);
        ezenList.add(500);

        //데이터 삽입하기 (특정 순번째에 삽입)
        ezenList.insert(1,900);
        ezenList.printAll();


        //리스트 초기화하기
        ezenList.clear();
        ezenList.printAll();

        System.out.println("==================================");

        //String타입의 객체 생성
        IList<String> ezenList2 = new MyArrayList<>();

        //데이터 삽입하기 (순차적 삽입)
        ezenList2.add("이순신");
        ezenList2.add("유관순");
        ezenList2.add("김구");
        ezenList2.add("안중근");
        ezenList2.add("나대용");

        //데이터 삭제하기 (요소 삭제)
        ezenList2.delete("나대용");

        //데이터 삭제하기 (특정 순번째 삭제)
        ezenList2.deleteByIndex(1);

        //리스트 탐색하기 (특정 순번째 데이터 리턴)
        System.out.println(ezenList2.get(0));

        //리스트 탐색하기 (특정 요소의 순번 리턴)
        ezenList2.indexOf("김구");

        //리스트 비어있는지 확인하기
        ezenList2.isEmpty();

        //특정 요소 포함 확인하기
        ezenList2.contains("유관순");

        //요소 사이즈 확인하기
        ezenList2.size();

        //리스트 내용 출력하기
        ezenList2.printAll();


    }
}
