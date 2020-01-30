clear all;

T=readmatrix('diabetes.csv');       % reading the .csv file
cnt=0;
male=0;
for c=1:769
    preg_raw(c)=T(c,1);             % extracting the raw data of the 
    gluc_raw(c)=T(c,2);             % 8 different attributes
    bl_pres_raw(c)=T(c,3);
    sk_th_raw(c)=T(c,4);
    ins_raw(c)=T(c,5);
    bmi_raw(c)=T(c,6);
    dia_raw(c)=T(c,7);
    age_raw(c) = T(c,8);
    out(c)=T(c,9);                  % outcome i.e. 
    p_mx = max(preg_raw);           % 1 = has diabetes, 
    p_mn = min(preg_raw);           % 0 = does not have diabetes
    g_mx = max(gluc_raw);
    g_mn = min(gluc_raw);
    bp_mx = max(bl_pres_raw);
    bp_mn = min(bl_pres_raw);
    skth_mx = max(sk_th_raw);
    skth_mn = min(sk_th_raw);
    ins_mx = max(ins_raw);
    ins_mn = min(ins_raw);
    bmi_mx = max(bmi_raw);
    bmi_mn = min(bmi_raw);
    dia_mx = max(dia_raw);
    dia_mn = min(dia_raw);
    age_mx = max(age_raw);
    age_mn = min(age_raw);
    preg(c)=(2*(preg_raw(c)-p_mn)/(p_mx-p_mn))-1;   %normalising the data
    gluc(c)=(2*(gluc_raw(c)-g_mn)/(g_mx-g_mn))-1;   %in the interval [-1,1]
    bl_pres(c)=(2*(bl_pres_raw(c)-bp_mn)/(bp_mx-bp_mn))-1;
    sk_th(c)=(2*(sk_th_raw(c)-skth_mn)/(skth_mx-skth_mn))-1;
    ins(c)=(2*(ins_raw(c)-ins_mn)/(ins_mx-ins_mn))-1;
    bmi(c)=(2*(bmi_raw(c)-bmi_mn)/(bmi_mx-bmi_mn))-1;
    dia(c)=(2*(dia_raw(c)-dia_mn)/(dia_mx-dia_mn))-1;
    age(c)=(2*(age_raw(c)-age_mn)/(age_mx-age_mn))-1;
    if out(c)==1
        cnt=cnt+1;
    end
    if preg_raw(c)==0
        sex(c)=1;             % sex(c) == 1 annotates male patient
        male=male+1;          % otherwise female patient 9th attribute
    else
        sex(c)=0;
    end
end
female=769-male;
out_TRUE = cnt/768;
display(out_TRUE*100);

DATA = horzcat(age', bl_pres', bmi', dia', gluc', ins', preg', sex', sk_th', out');



