

public class hrk {

public static void main(String[] args){
	
	String s="femeie";
	String stilDeViata="activ";
	String cc="ectomorf";
	String ob="hipertrofie";
	String nStres="9-10";
	boolean aptSport=false;
	boolean boliCardiace=false;
	boolean tBoala=false;
	boolean interventiiChirurgicale=false;
	//boolean nasteri=false;
	
	System.out.println(register(s,stilDeViata,cc,ob,nStres,aptSport,boliCardiace,tBoala,interventiiChirurgicale));
} 
public static int register(String s,String stilDeViata,String cc,String ob,String nStres,boolean aptSport,boolean boliCardiace,boolean tBoala,boolean interventiiChirurgicale){
	int rez=0;
	if(s==Constante.barbat){
		rez+=Constante.intBarbat;
	}else if(s==Constante.femeie){
		rez+=Constante.intFemeie;
	}
	if(stilDeViata==Constante.sedentar){
		rez+=Constante.intSedentar;
	}else if(stilDeViata==Constante.semiActiv){
		rez+=Constante.intSemiActiv;
	}else if(stilDeViata==Constante.activ){
		rez+=Constante.intActiv;
	}
	if(cc==Constante.ectomorf){
		rez+=Constante.intEctomorf;
	}else if(cc==Constante.mezomorf){
		rez+=Constante.intMezomorf;
	}else if(cc==Constante.endomorf){
		rez+=Constante.intEndomorf;
	}
	if(ob==Constante.slabire){
		rez+=Constante.intSlabire;
	}else if(ob==Constante.hipertrofie){
		rez+=Constante.intHipertrofie;
	}
	if(nStres==Constante.lowStress){
		rez+=Constante.intLowStress;
	}else if(nStres==Constante.midStress){
		rez+=Constante.intMidStress;
	}else if(nStres==Constante.highStress){
		rez+=Constante.intHighStress;
	}
	if(aptSport){
		rez=-1;
	}else if(boliCardiace){
		rez=-1;
	}else if(tBoala){
		rez=-1;
	}else if(interventiiChirurgicale){
		rez=-1;
	}
	
	return rez;
}
}