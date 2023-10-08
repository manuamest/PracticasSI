entradas = xlsread('SIBD.xlsx','ENTRADAS')';
salidasDeseadas = xlsread('SIBD.xlsx','SALIDAS')';

arquitecturas ={[8], [10], [15], [9], [5 3], [8 3], [8 5], [10 5]};

for i = 1:length(arquitecturas),
    arquitectura = arquitecturas{i};

    precisionEntrenamiento = [];
    precisionValidacion = [];
    precisionTest = [];
    for j = 1:50,
        rna = patternnet(arquitectura);
        rna.trainParam.showWindow = false;
        [rna, tr] = train(rna, entradas, salidasDeseadas);
        salidasRNA = sim(rna, entradasT);

        precisionEntrenamiento(end+1) = 1-confusion(salidasDeseadasT(:,tr.trainInd), salidasRNA(:, tr.trainInd));
        precisionValidacion(end+1) = 1-confusion(salidasDeseadasT(:,tr.trainInd), salidasRNA(:, tr.trainInd));
        precisionTest(end+1) = 1-confusion(salidasDeseadasT(:,tr.trainInd), salidasRNA(:, tr.trainInd));
    end;
    %mediaPrecisionEntrenamiento = mean (precisionEntrenamiento);
    %desviacionTipicaPrecisionEntrenamiento = std(precisionEntrenamiento);
    %mediaPrecisionValidacion = mean (precisionValidacion);
    %desviacionTipicaPrecisionValidacion = std(precisionValidacion);
    mediaPrecisionTest = mean (precisionTest);
    desviacionTipicaPrecisionTest = std(precisionTest);
    fprintf('%d MediaTest: %.2f DesviacionTipicaTest: %.2f\n', i, mediaPrecisionTest, desviacionTipicaPrecisionTest);
end;

