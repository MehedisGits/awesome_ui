import 'package:flutter/material.dart';
import 'package:awesome_ui/awesome_ui.dart';

class DataDisplayShowcaseScreen extends StatefulWidget {
  const DataDisplayShowcaseScreen({super.key});

  @override
  State<DataDisplayShowcaseScreen> createState() => _DataDisplayShowcaseScreenState();
}

class _DataDisplayShowcaseScreenState extends State<DataDisplayShowcaseScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuiText(
            'Data Display Showcase',
            variant: AuiTextVariant.headlineLarge,
          ),
          const SizedBox(height: 24),
          
          // Data Table Section
          _buildDataTableSection(),
          
          const SizedBox(height: 32),
          
          // Timeline Section
          _buildTimelineSection(),
          
          const SizedBox(height: 32),
          
          // Tree View Section
          _buildTreeViewSection(),
        ],
      ),
    );
  }

  Widget _buildDataTableSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Data Table',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Basic Data Table
            const AuiText('Basic Data Table', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            DataTable(
              columns: const [
                DataColumn(label: AuiText('Name')),
                DataColumn(label: AuiText('Age')),
                DataColumn(label: AuiText('Email')),
                DataColumn(label: AuiText('Status')),
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(AuiText('John Doe')),
                    DataCell(AuiText('25')),
                    DataCell(AuiText('john@example.com')),
                    DataCell(AuiText('Active')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(AuiText('Jane Smith')),
                    DataCell(AuiText('30')),
                    DataCell(AuiText('jane@example.com')),
                    DataCell(AuiText('Inactive')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(AuiText('Bob Johnson')),
                    DataCell(AuiText('28')),
                    DataCell(AuiText('bob@example.com')),
                    DataCell(AuiText('Active')),
                  ],
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Sortable Data Table
            const AuiText('Sortable Data Table', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            DataTable(
              sortAscending: true,
              sortColumnIndex: 0,
              columns: const [
                DataColumn(label: AuiText('Product')),
                DataColumn(label: AuiText('Price')),
                DataColumn(label: AuiText('Stock')),
                DataColumn(label: AuiText('Category')),
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(AuiText('Laptop')),
                    DataCell(AuiText('\$999')),
                    DataCell(AuiText('15')),
                    DataCell(AuiText('Electronics')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(AuiText('Phone')),
                    DataCell(AuiText('\$699')),
                    DataCell(AuiText('25')),
                    DataCell(AuiText('Electronics')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(AuiText('Book')),
                    DataCell(AuiText('\$19')),
                    DataCell(AuiText('100')),
                    DataCell(AuiText('Education')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Timeline',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Basic Timeline
            const AuiText('Basic Timeline', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Column(
              children: [
                _buildTimelineItem(
                  'Project Started',
                  'Initial project setup and planning',
                  '2024-01-01',
                  Icons.play_arrow,
                ),
                _buildTimelineItem(
                  'First Milestone',
                  'Completed basic functionality',
                  '2024-01-15',
                  Icons.check,
                ),
                _buildTimelineItem(
                  'Testing Phase',
                  'Comprehensive testing and bug fixes',
                  '2024-01-30',
                  Icons.bug_report,
                ),
                _buildTimelineItem(
                  'Project Completed',
                  'Final delivery and deployment',
                  '2024-02-15',
                  Icons.flag,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem(String title, String subtitle, String time, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: AuiIcon(
              icon,
              color: Colors.white,
              size: AuiIconSize.sm,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuiText(
                  title,
                  variant: AuiTextVariant.titleSmall,
                ),
                const SizedBox(height: 4),
                AuiText(
                  subtitle,
                  variant: AuiTextVariant.bodySmall,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(height: 4),
                AuiText(
                  time,
                  variant: AuiTextVariant.labelSmall,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTreeViewSection() {
    return AuiCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuiText(
              'Tree View',
              variant: AuiTextVariant.titleMedium,
            ),
            const SizedBox(height: 16),
            
            // Basic Tree View
            const AuiText('Basic Tree View', variant: AuiTextVariant.titleSmall),
            const SizedBox(height: 8),
            Container(
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildTreeItem('Documents', Icons.folder, [
                    _buildTreeItem('Work', Icons.work, [
                      _buildTreeItem('Project A', Icons.description, []),
                      _buildTreeItem('Project B', Icons.description, []),
                    ]),
                    _buildTreeItem('Personal', Icons.person, [
                      _buildTreeItem('Photos', Icons.photo, []),
                      _buildTreeItem('Videos', Icons.video_library, []),
                    ]),
                  ]),
                  _buildTreeItem('Downloads', Icons.download, [
                    _buildTreeItem('Software', Icons.computer, []),
                    _buildTreeItem('Media', Icons.music_note, []),
                  ]),
                  _buildTreeItem('Pictures', Icons.image, []),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTreeItem(String title, IconData icon, List<Widget> children) {
    return ExpansionTile(
      leading: AuiIcon(icon, size: AuiIconSize.sm),
      title: AuiText(title),
      children: children,
    );
  }
}