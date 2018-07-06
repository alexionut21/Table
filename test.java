



public class test {
	public static void main(String[] args){
		plan(10010531);
}

	private static int plan(int id) {
		int conf=(id/10)%10;
		System.out.println(conf);
		int obj=(id/1000)%100;
		String stringNume="";
		int idPlan=0;
		if(conf==1){
			stringNume+="Ectomorf";
			idPlan+=1;
		}else if(conf==2){
			stringNume+="Mesomorf";
			idPlan+=2;
		}else if(conf==3){
			stringNume+="Endomorf";
			idPlan+=3;
		}
		System.out.println(stringNume);
		if(obj==1){
			stringNume+="Slabire";
		}else{
			stringNume+="Hipertrofie";
			idPlan+=10;
		}
		System.out.println(stringNume);
		System.out.println(idPlan);
		return idPlan;
	
	}
	

} 

