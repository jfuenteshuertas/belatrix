//
//  ViewController.m
//  Belatrix
//
//  Created by Javier Fuentes Huertas on 13/01/18.
//  Copyright © 2018 Javier Fuentes Huertas. All rights reserved.
//

#import "ViewController.h"
#import "sportEventTableViewCell.h"
#import "SportEvent.h"
#import "Function.h"
#import "DetailSportEventViewController.h"
#import "SportEventDAO.h"
@interface ViewController (){
    NSMutableArray *dataSource;
    SportEventDAO* sporEventDAO;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    sporEventDAO = [[SportEventDAO alloc]init:[Function databaseFilePath]];
    _listSportEvent = [self getArraySportEvents];
    _listSportEvent = [Function orderNSMutuableArrayByDate:_listSportEvent];
    [_sportEventUITableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger numberSections=[self getNumberSectionFromListSportEvent:_listSportEvent];
    if(numberSections==0){
        UILabel *noDataLabel         = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _sportEventUITableView.bounds.size.width, _sportEventUITableView.bounds.size.height)];
        noDataLabel.text             = @"No Sport Events available";
        noDataLabel.textColor        = [UIColor blackColor];
        noDataLabel.textAlignment    = NSTextAlignmentCenter;
        _sportEventUITableView.backgroundView = noDataLabel;
        _sportEventUITableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return numberSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSMutableArray* tempListSportEvent=dataSource[section];
    return tempListSportEvent.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"SportEventCell";
    sportEventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        [tableView registerNib:[UINib nibWithNibName:@"sportEventTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
        cell =[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    }
    [self setLayerCell:cell];
    NSMutableArray* tempListSportEvent=dataSource[indexPath.section];
    SportEvent* tempSportEvent=tempListSportEvent[indexPath.item];
    [self setEventSportToCell:cell sportEventModel:tempSportEvent];
    return cell;
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray* tempListSportEvent=dataSource[indexPath.section];
    SportEvent* tempSportEvent=tempListSportEvent[indexPath.item];
    [self performSegueWithIdentifier:@"segueDetailsEventSport" sender:tempSportEvent];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 20)];
   // view.layer.cornerRadius = 5;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 20)];
    [label setFont:[UIFont boldSystemFontOfSize:14]];
    [label setTextColor:[UIColor whiteColor]];
    NSMutableArray* tempSection = dataSource[section];
    SportEvent* tempSportEvent = tempSection[0];
    [label setText:[Function getFullNameDayFromNSDate:tempSportEvent.datetimeStartEvent]];
    [view addSubview:label];
    [view setBackgroundColor:[UIColor darkGrayColor]]; 
    return view;
}
#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueDetailsEventSport"]) {
        DetailSportEventViewController* detailEvent= segue.destinationViewController;
        SportEvent* sportEvent = (SportEvent*)sender;
        detailEvent.sportEvent = sportEvent;
    }
}

#pragma mark - Own methods

-(void) setLayerCell:(UITableViewCell* )cell{
    [cell setAlpha:0.75];
    cell.layer.masksToBounds = NO;
    cell.layer.cornerRadius=5;
    cell.layer.shadowOffset = CGSizeMake(3.0f, 3.0f);
    cell.layer.shadowRadius = 1;
    UIBezierPath *path=[UIBezierPath bezierPathWithRect:cell.bounds];
    cell.layer.shadowPath = path.CGPath;
    cell.layer.shadowOpacity = 0.2;
    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.layer.borderWidth = 0.2f;
    cell.backgroundColor = [UIColor colorWithRed:228.0/255.0 green:228.0/255.0 blue:228.0/255.0 alpha:0.5];
}

-(NSMutableArray*) getArraySportEvents{
    NSMutableArray* listSportEvent = sporEventDAO.read;
    return listSportEvent;
}
- (void) setEventSportToCell:(sportEventTableViewCell*)cell sportEventModel:(SportEvent*)sportEvent{
    cell.eventNameUILabel.text = sportEvent.nameEvent;
    cell.locationEventUILabel.text = sportEvent.locationEvent;
    cell.numberCompetitorUILabel.text = [NSString stringWithFormat:@"%d/%d",(int)sportEvent.numberCompetitorEvent,(int)sportEvent.capacityEvent];
    cell.scheduleEventUILabel.text =[NSString stringWithFormat:@"%@ - %@",[Function getHourFromDate:sportEvent.datetimeStartEvent],[Function getHourFromDate:sportEvent.datetimeEndEvent]];
}
- (int) getNumberSectionFromListSportEvent:(NSMutableArray*)listSportEvent{
    dataSource = [NSMutableArray new];
    int section = 0;
    [dataSource addObject:[NSMutableArray array]];
    if(_listSportEvent.count==0)return 0;
    if(_listSportEvent.count==1){
        SportEvent *firstObject = listSportEvent[0];
        NSMutableArray *sectionArray = dataSource[0];
        [sectionArray addObject:firstObject];
    }
    for (int i = 0; i < listSportEvent.count - 1; i++) {
        SportEvent *firstObject = listSportEvent[i];
        SportEvent *secondObject = listSportEvent[i+1];
        
        NSDate *firstDate = firstObject.datetimeStartEvent;
        NSDate *secondDate = secondObject.datetimeStartEvent;
        
        NSMutableArray *sectionArray = dataSource[section];
        
        if (![sectionArray containsObject:firstObject]) {
            [sectionArray addObject:firstObject];
        }
        if(![[NSCalendar currentCalendar] isDate:firstDate inSameDayAsDate:secondDate]){
            NSMutableArray *newSection = [NSMutableArray array];
            [newSection addObject:secondObject];
            [dataSource addObject:newSection];
            section++;
        }
    }
    //[dataSource.lastObject addObject:listSportEvent.lastObject];
    return (int) dataSource.count;
}
@end
