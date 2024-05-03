//
//  AppDelegate.m
//  NSMenuToolbarItem_test
//
//  Created by Gregory John Casamento on 5/3/24.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSToolbar *toolbar = [[NSToolbar alloc] init];

    [toolbar setDelegate: self];
    [toolbar insertItemWithItemIdentifier:menuToolbarItemIdentifier atIndex:0];

    NSLog(@"toolbar = %@", toolbar);
    NSLog(@"window = %@", self.window);

    [toolbar setVisible: YES];
    
    [self.window setToolbar: toolbar];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

// Toolbar delegate
- (NSArray<NSToolbarItemIdentifier> *) toolbarAllowedItemIdentifiers: (NSToolbar *)toolbar
{
    return [NSArray arrayWithObjects: menuToolbarItemIdentifier, NSToolbarPrintItemIdentifier, nil];
}

- (NSArray<NSToolbarItemIdentifier> *)toolbarDefaultItemIdentifiers:(NSToolbar *)toolbar
{
    return [NSArray arrayWithObjects: menuToolbarItemIdentifier, NSToolbarPrintItemIdentifier, nil];
}

- (NSToolbarItem *)toolbar:(NSToolbar *)toolbar itemForItemIdentifier:(NSToolbarItemIdentifier)itemIdentifier willBeInsertedIntoToolbar:(BOOL)flag
{
    if ([itemIdentifier isEqual: menuToolbarItemIdentifier])
    {
        NSMenuToolbarItem *item = [[NSMenuToolbarItem alloc] initWithItemIdentifier: itemIdentifier];
        
        NSMenu *testMenu = [[NSMenu alloc] initWithTitle: @"Test Menu"];
        NSMenuItem *item0 = [[NSMenuItem alloc] initWithTitle: @"Item 0" action: NULL keyEquivalent: @""];
        [testMenu addItem: item0];
        
        [item setMenu: testMenu];
        
        return item;
    }
    
    return [[NSToolbarItem alloc] initWithItemIdentifier: NSToolbarPrintItemIdentifier];
}

@end
