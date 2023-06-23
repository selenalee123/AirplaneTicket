#import "ViewController.h"
#import "CheckoutViewController.h"


@interface ViewController ()

@property (strong, nonatomic) NSArray *ticketTypes;
@property (nonatomic, strong) NSMutableArray *ticketList;
@property (strong, nonatomic) NSString *selectedTicketType;
@property (assign, nonatomic) NSInteger selectedTicketCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ticketTypes = @[@"VIP",@"Economy Adult",@"Economy Kid", @"Business", @"First Class",@"Infant",];
    self.ticketList = [NSMutableArray array];
    
    self.ticketTypePickerView.delegate = self;
    self.ticketTypePickerView.dataSource = self;
    self.selectedTicketCount = 1; self.selectedTicketType = self.ticketTypes[0];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (IBAction)addTicketButtonPressed:(id)sender {
    NSString *ticketNumber = self.ticketNumberTextField.text;
    
    NSInteger ticketCount = [ticketNumber integerValue];
    if (ticketCount <= 0) {
        return;
    }
    
    NSString *ticketInfo = [NSString stringWithFormat:@"%@ quantity is  %ld", self.selectedTicketType, (long)ticketCount];
    [self.ticketList addObject:ticketInfo];
    self.ticketListTextView.text = [self.ticketList componentsJoinedByString:@"\n"];
    
    // Reset input fields
    self.ticketNumberTextField.text = @"";
    [self.ticketTypePickerView selectRow:0 inComponent:0 animated:NO];
    self.selectedTicketType = self.ticketTypes[0];
    self.selectedTicketCount = 1;
}

- (IBAction)goToCheckoutButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"checkoutSegue" sender:self];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.ticketTypes.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.ticketTypes[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.selectedTicketType = self.ticketTypes[row];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ticketList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ticketCell" forIndexPath:indexPath];
    cell.textLabel.text = self.ticketList[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.ticketList removeObjectAtIndex:indexPath.row];
        self.ticketListTextView.text = [self.ticketList componentsJoinedByString:@"\n"];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"checkoutSegue"]) {
        CheckoutViewController *checkoutViewController = segue.destinationViewController;
        checkoutViewController.ticketList = self.ticketList;
        checkoutViewController.selectedTicketType = self.selectedTicketType;
    }
}

@end
