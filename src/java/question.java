public class question {

    int qid;
    String questiontitle;
    String questionphotopath;
    String optionA;
    String optionB;
    String optionC;
    String optionD;
    String answer;
    String questiontype;
    public String useranswer;
 
 public   question(int qid,String answer,String optionA,String optionB,String optionC,String optionD,String questiontype,String questionphotopath,String questiontitle ) {
        this.qid = qid;
        this.answer = answer;
        this.optionA = optionA;
        this.optionB = optionB;
        this.optionC = optionC;
        this.optionD = optionD;
        this.questiontype = questiontype;
        this.questionphotopath = questionphotopath;
        this.questiontitle = questiontitle;
        this.useranswer="";
    }
    
}
