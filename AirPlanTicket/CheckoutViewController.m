#import "CheckoutViewController.h"

@interface CheckoutViewController ()

@end

@implementation CheckoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"checkoutCell"];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ticketList.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"checkoutCell" forIndexPath:indexPath];
    
    NSString *ticketInfo = self.ticketList[indexPath.row];
    NSArray *components = [ticketInfo componentsSeparatedByString:@" quantity is "];
    if (components.count == 2) {
        NSString *ticketType = components[0];
        NSString *ticketCount = components[1];
        cell.textLabel.text = [NSString stringWithFormat:@"%@   %@", ticketType, ticketCount];
    }
    
    return cell;
}
- (IBAction)doneButtonPressed:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Thank You!" message:@"Enjoy Your Trip!" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
