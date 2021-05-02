function [] = finalProject()
    global count;
    count.pitch = 0;
    count.fig = figure('numbertitle','off','name','Pitch Count');
    count.subT = 0;
    count.strike = 0;
    count.totalStrike = 0;
    count.ball = 0;
    count.totalBall = 0;

   
    count.pitchTypeButton(1) = uicontrol('style','pushbutton','units','normalized','position',[.07 .80 .25 .125],'string','Pitch #1','callback',{@addPitch,1,1});
    count.pitchTypeStrike(1) = uicontrol('style','text','units','normalized','position',[.40 .80 .05 .09],'string',count.strike);
    count.pitchTypeBall(1) = uicontrol('style','text','units','normalized','position',[.60 .80 .05 .09],'string',count.ball);
    count.subPitchT(1) = uicontrol('style','text','units','normalized','position',[.80 .80 .05 .09],'string',count.subT);
    
    count.pitchTypeButton(2) = uicontrol('style','pushbutton','units','normalized','position',[.07 .65 .25 .125],'string','Pitch #2','callback',{@addPitch,1,2});
    count.pitchTypeStrike(2) = uicontrol('style','text','units','normalized','position',[.40 .65 .05 .09],'string',count.strike);
    count.pitchTypeBall(2) = uicontrol('style','text','units','normalized','position',[.60 .65 .05 .09],'string',count.ball);
    count.subPitchT(2) = uicontrol('style','text','units','normalized','position',[.80 .65 .05 .09],'string',count.subT);
    
    count.pitchTypeButton(3) = uicontrol('style','pushbutton','units','normalized','position',[.07 .50 .25 .125],'string','Pitch #3','callback',{@addPitch,1,3});
    count.pitchTypeStrike(3) = uicontrol('style','text','units','normalized','position',[.40 .50 .05 .09],'string',count.strike);
    count.pitchTypeBall(3) = uicontrol('style','text','units','normalized','position',[.60 .50 .05 .09],'string',count.ball);
    count.subPitchT(3) = uicontrol('style','text','units','normalized','position',[.80 .50 .05 .09],'string',count.subT);
    
    count.pitchTypeButton(4) = uicontrol('style','pushbutton','units','normalized','position',[.07 .35 .25 .125],'string','Pitch #4','callback',{@addPitch,1,4});
    count.pitchTypeStrike(4) = uicontrol('style','text','units','normalized','position',[.40 .35 .05 .09],'string',count.strike);
    count.pitchTypeBall(4) = uicontrol('style','text','units','normalized','position',[.60 .35 .05 .09],'string',count.ball);
    count.subPitchT(4) = uicontrol('style','text','units','normalized','position',[.80 .35 .05 .09],'string',count.subT);
    
    count.pitchTypeButton(5) = uicontrol('style','pushbutton','units','normalized','position',[.07 .20 .25 .125],'string','Pitch #5','callback',{@addPitch,1,5});
    count.pitchTypeStrike(5) = uicontrol('style','text','units','normalized','position',[.40 .20 .05 .09],'string',count.strike);
    count.pitchTypeBall(5) = uicontrol('style','text','units','normalized','position',[.60 .20 .05 .09],'string',count.ball);
    count.subPitchT(5) = uicontrol('style','text','units','normalized','position',[.80 .20 .05 .09],'string',count.subT);
    
    count.strikeMessage = uicontrol('style','text','units','normalized','position',[.40 .875 .05 .09],'string','Strike');
    count.ballMessage = uicontrol('style','text','units','normalized','position',[.60 .875 .05 .09],'string','Ball'); 
    count.sbMessage = uicontrol('style','text','units','normalized','position',[.80 .875 .05 .09],'string','Sub Total');
    count.totalPitchMessage = uicontrol('style','text','units','normalized','position',[.75 .08 .05 .09],'string','Total:');
    count.totalStrikeS = uicontrol('style','text','units','normalized','position',[.40 .08 .05 .09],'string',count.totalStrike);
    count.totalStrikeMessage = uicontrol('style','text','units','normalized','position',[.35 .08 .05 .09],'string','Total Strike:');
    count.totalBallB = uicontrol('style','text','units','normalized','position',[.60 .08 .05 .09],'string',count.totalBall);
    count.totalBallMessage = uicontrol('style','text','units','normalized','position',[.55 .08 .05 .09],'string','Total Ball:');
    count.totalPitch = uicontrol('style','text','units','normalized','position',[.80 .08 .05 .09],'string',count.pitch);
    count.graph = uicontrol('style','pushbutton','units','normalized','position',[.07 .05 .25 .125],'string','Graph','callback',{@addGraph});
end

function [] = addPitch(~,~,pitch,index)
    global count;
    
    count.pitch = count.pitch + pitch;
    count.totalPitch = uicontrol('style','text','units','normalized','position',[.80 .08 .05 .09],'string',count.pitch);
    
    count.sbQuest = questdlg('Strike or Ball?','Pitch','Strike','Ball','Strike');
    switch count.sbQuest
        case 'Strike'
            pitchCount = str2double(count.pitchTypeStrike(index).String);
            pitchCount = pitchCount + 1;
            count.pitchTypeStrike(index).String = pitchCount;
            count.totalStrike = count.totalStrike + 1;
            count.totalStrikeS.String = count.totalStrike;
            
        case 'Ball'
            pitchCount = str2double(count.pitchTypeBall(index).String);
            pitchCount = pitchCount + 1;
            count.pitchTypeBall(index).String = pitchCount;
            count.totalBall = count.totalBall + 1;
            count.totalBallB.String = count.totalBall;

    end
    pC = str2double(count.pitchTypeStrike(index).String) + str2double(count.pitchTypeBall(index).String);
    count.subPitchT(index).String = pC;
    
end

function [] = addGraph(~,~,~)
global count;

        y = [str2double(count.pitchTypeStrike(1).String),str2double(count.pitchTypeBall(1).String)
             str2double(count.pitchTypeStrike(2).String),str2double(count.pitchTypeBall(2).String) 
             str2double(count.pitchTypeStrike(3).String),str2double(count.pitchTypeBall(3).String) 
             str2double(count.pitchTypeStrike(4).String),str2double(count.pitchTypeBall(4).String) 
             str2double(count.pitchTypeStrike(5).String),str2double(count.pitchTypeBall(5).String)];
        figure
        bar(y,'stacked');
        xlabel('Pitch Type');
        ylabel('Number of Pitches');
        legend('Strike','Ball');
        title('Pitching Chart')
end